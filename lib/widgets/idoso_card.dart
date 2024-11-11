import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail_idoso.dart';

class IdosoCard extends StatelessWidget {
  final IdosoModelo idoso;
  final Function(IdosoModelo) onEdit;
  final Function(IdosoModelo) onDelete;

  const IdosoCard({
    Key? key,
    required this.idoso,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IdosoDetailPage(idosoModelo: idoso)
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              _buildAvatar(),
              SizedBox(width: 16),
              Expanded(
                child: _buildIdosoInfo(),
              ),
              _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          idoso.nome.substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildIdosoInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          idoso.nome,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(height: 8),
        _buildInfoRow(),
        SizedBox(height: 8),
        _buildInstitucionalizacaoRow(),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Flexible(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 376) {
            // Layout vertical para telas menores
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.cake, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '${idoso.idade} anos',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.person, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      idoso.sexo,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          
          // Layout horizontal para telas maiores
          return Row(
            children: [
              Icon(Icons.cake, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                '${idoso.idade} anos',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.person, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                idoso.sexo,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInstitucionalizacaoRow() {
    return Flexible(
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 14, color: Colors.grey),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              'Data de Institucionalização: ${idoso.dataInstitucionalizacao}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.grey[600], size: 20),
          constraints: BoxConstraints(minWidth: 40, minHeight: 40),
          padding: EdgeInsets.zero,
          onPressed: () => onEdit(idoso),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red[400], size: 20),
          constraints: BoxConstraints(minWidth: 40, minHeight: 40),
          padding: EdgeInsets.zero,
          onPressed: () => onDelete(idoso),
        ),
      ],
    );
  }
}
